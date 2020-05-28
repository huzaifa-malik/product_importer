require 'test_helper'

class ProductImporterTest < ActiveSupport::TestCase

  test "succesful product importer" do
    file_path = "#{Rails.root}/test/fixtures/files/data.csv"
    inserted_records = ProductServices::ProductImporter.run(file_path: file_path, override: nil)
    records = CsvReaders::ProductCsvReader.read(file_path: file_path)
    assert_equal inserted_records.count, records.count
  end

  test "same db columns as csv headers" do
    file_path = "#{Rails.root}/test/fixtures/files/data.csv"
    records = CsvReaders::ProductCsvReader.read(file_path: file_path)
    headers = records.first.keys
    columns = Product.column_names - ["created_at", "updated_at", "id"]
    assert_equal headers.map(&:to_s).sort, columns.sort
  end

  test "overrider should delete old records" do
    file_path = "#{Rails.root}/test/fixtures/files/data.csv"
    ProductServices::ProductImporter.run(file_path: file_path, override: "true")
    records = CsvReaders::ProductCsvReader.read(file_path: file_path)
    assert_equal Product.pluck(:part_number).sort, records.map { |record| record[:part_number].to_s}.sort
  end

  test "invalid_data importer" do
    file_path = "#{Rails.root}/test/fixtures/files/invalid_data.csv"
    assert_raises ExceptionHandlers::ServiceError do
      ProductServices::ProductImporter.run(file_path: file_path, override: "true")
    end
  end

end
