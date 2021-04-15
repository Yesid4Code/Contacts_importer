class InvalidRecordsController < ApplicationController

  def index
    @invalid_records = InvalidRecord.all.paginate(page: params[:page], per_page: 20)
  end
end
