module CsvReaders::ProductCsvReader

  def self.read(file_path:)
    records = []
    SmarterCSV.process(file_path, {col_sep: '|', remove_empty_values: false, remove_zero_values: false}) do |row|
      records << row if row[0][:part_number] != nil
    end
    records.flatten
  rescue StandardError => e
    raise ExceptionHandlers::ServiceError, "File could not be processed with exception: #{e}"
  end
end
