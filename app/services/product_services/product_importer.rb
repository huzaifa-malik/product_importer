module ProductServices::ProductImporter

  def self.run(file_path:, override:)
    records = CsvReaders::ProductCsvReader.read(file_path: file_path)
    Product.delete_all if override
    Product.upsert_all(records, unique_by: "index_products_on_part_number")
  rescue StandardError => e
    raise ExceptionHandlers::ServiceError, "File could not be processed with exception: #{e}"
  end
end
