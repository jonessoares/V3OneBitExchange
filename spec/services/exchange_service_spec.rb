require 'rails_helper'
require 'json'
require './app/services/exchange_service'


describe ExchangeService do
  let(:source_currency){ 'USD'}
  let(:target_currency){ 'BRL'}
  let(:exchange_value){ 3.4546 }
  #declaracao variaveis
  let(:api_return) do   #Simular o retorno para validar a conversao
      { currency: [
          currency: "#{source_currency}/#{target_currency}",
          value: exchange_value,   #valor da taxa conversao
          date: Time.now,
          type: 'Original'          #api devolve
        ]
      }
     
  end
 
    #interceptar a chamada
    before do
       allow(RestClient).to receive(:get) { OpenStruct.new(body: api_return.to_json) }  
          #Permite a chamada GET/roda antes it  / devolve estrutura
    end

   	it '#call' do 
   		amount = rand(0..9999)
   		service_exchange = ExchangeService.new('USD', 'BRL', amount).call
   		expect_exchange = amount * exchange_value
   		expect(service_exchange).to eq(expect_exchange)
   		#testes sao expect
	end
   #resultado previamente conhecido para ter certeza da resposta
end
