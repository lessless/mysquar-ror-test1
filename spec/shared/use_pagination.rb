RSpec.shared_examples "use pagination" do
  let(:pagination_info) do
    {
      'page'        => '1',
      'per_page'    => '2',
      'total_count' => '3'
    }
  end
end
