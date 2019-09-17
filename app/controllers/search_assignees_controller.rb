class SearchAssigneesController < ApplicationController
  protect_from_forgery except: :search

  def index
    @search_assignee = SearchAssignee1.order(:id)
  end

  def search
    @search_assignee = SearchAssignee1.new({value: params[:word]})
    if @search_assignee.save
      result = Peds::Client.search_by(firstNamedApplicant: params[:word])
      @docs = result[:body][:queryResults][:searchResponse][:response][:docs]
    end
  end
end
