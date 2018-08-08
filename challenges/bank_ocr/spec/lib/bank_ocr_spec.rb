=begin
You work for a bank, which has recently purchased an ingenious machine to assist in reading letters and faxes sent in by branch offices. The machine scans the paper documents, and produces a file with a number of entries which each look like this:
=end

require "bank_ocr"


describe BankOcr do
  describe 'parsing tests' do
    it 'parses an account number' do
      num = "    _  _     _  _  _  _  _ \n" +
            "  | _| _||_||_ |_   ||_||_|\n" +
            "  ||_  _|  | _||_|  ||_| _|\n"
      expect(BankOcr.new(num).account_number).to eq '123456789'
    end
    
    it 'parses another account number' do
      num = "    _  _     _  _  _  _  _ \n" +
            "  | _| _||_||_ |_   ||_||_|\n" +
            "  | _| _|  | _||_|  ||_||_|\n"
      expect(BankOcr.new(num).account_number).to eq '133456788'
    end
    
    it 'returns an error if the number can not be parsed' do
      num = "    _  _     _  _  _  _  _ \n" +
            "  | _| _||_||_ |_   ||_||_|\n" +
            "  _| _|  | _||_|  ||_||_|\n"
      expect do
        BankOcr.new(num).account_number
      end.to raise_error "The account number could not be parsed"
    end
  end
end