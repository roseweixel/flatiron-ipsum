class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }
  set :public_folder, Proc.new { File.join(root, '../../public')}
end