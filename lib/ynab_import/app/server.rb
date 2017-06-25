require "bundler/setup"
require "sinatra"
require "ynab_import"
require "ynab_import/utils"

get "/" do
  erb :new
end

post "/convert" do
  content_type "text/csv"

  FileUtils.cp uploaded_file.path, tempfile

  YnabImport::Utils.array_to_csv(converted_data)
end

private

  def converted_data
   YnabImport::Converter.new(tempfile.path).convert
  end

  def uploaded_file
    params[:file][:tempfile]
  end

  def tempfile
    @_tempfile ||= Tempfile.new(params[:file][:filename])
  end
