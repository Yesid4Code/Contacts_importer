class InvalidRecordsController < ApplicationController

  def index
    @invalid_records = InvalidRecord.all
  end
end
