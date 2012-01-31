# features/support/paths.rb

def path_to(page_name)
  case page_name

when /the list of vacancies/
  vacancies_path

  # and so forth...

  else
    raise "Can't find mapping from \"#{page_name}\" to a path."
  end
end

