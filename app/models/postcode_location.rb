class PostcodeLocation < ActiveRecord::Base

  def self.format_postcode(postcode)
    r = /([A-PR-UWYZ](?:[0-9]{1,2}|(?:[A-HK-Y][0-9]|[A-HK-Y][0-9](?:[0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW]))(?:(?:\ |)([0-9][ABD-HJLNP-UW-Z]{2})|)/i
    m = r.match postcode

    if (m)
      outcode = m[1]
      incode = m[2]

      outcode = outcode.upcase unless outcode.blank?
      incode = incode.upcase unless incode.blank?
      {:out_code => outcode, :in_code => incode, :postcode => "#{outcode} #{incode}".strip }
    else
      raise "Postcode format invalid"
    end
  end

  def self.distance(postcode1, postcode2)
    begin
      pc1 = format_postcode(postcode1)
      pc2 = format_postcode(postcode2)

      pcl1 = PostcodeLocation.find_by_postcode(pc1[:out_code])
      pcl2 = PostcodeLocation.find_by_postcode(pc2[:out_code])

      dLat = to_rads(pcl2.latitude-pcl1.latitude)
      dLon = to_rads(pcl2.longitude-pcl1.longitude)
      lat1 = to_rads(pcl1.latitude)
      lat2 = to_rads(pcl2.latitude)

      a = Math.sin(dLat/2) * Math.sin(dLat/2) +
          Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2)
      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
      d = 6371 * c # km

      { :km => d.round(2), :miles => (d * 0.621371192).round(2) }
  rescue Exception => e
      { :km => -1, :miles => -1, :error => e.message }
    end
  end

private

  def self.to_rads(degrees)
    degrees * Math::PI / 180
  end

end

