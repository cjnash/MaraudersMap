class NotesController < ApplicationController
  def create
    @page = Page.find(params[:page_id])
    @note = @page.notes.create(params[:note])
    redirect_to page_path(@page)
  end
end
