require 'rspec'

RSpec.describe 'PurchaseProcessor' do
  context 'with a valid input file' do
    let(:file_path) { 'input/purchases.json' }

    it 'generates all receipts' do
      result = PurchaseProcessor.new(file_path).call
      expect(result).to be_a(Array)
      expect(result.length).to eq(3)
    end

    it 'calls the ReceiptGenerator for each purchase' do
      allow(ReceiptGenerator).to receive(:new).and_return(double(call: 'receipt'))
      PurchaseProcessor.new(file_path).call
      expect(ReceiptGenerator).to have_received(:new).exactly(3).times
    end
  end
end
