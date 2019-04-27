class SearchRecordsController < ApplicationController
  protect_from_forgery except: :search

  def index
    @search_records = SearchRecord.order(:id)
  end

  def search
    @search_record = SearchRecord.new({value: params[:word]})
    if @search_record.save
      result = Peds::Client.search_by(firstNamedApplicant: params[:word])
      @docs = result[:body][:queryResults][:searchResponse][:response][:docs]
    end
  end        
end
