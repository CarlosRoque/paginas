require_dependency "paginas/application_controller"
module Paginas
  class PagesController < ApplicationController
    before_action :set_page, only: [:display,:show, :edit, :update, :destroy]
    before_action :set_categories, only: [:edit,:new,:update,:destroy]
    def index
      @pages = Page.all
    end
    def featured
      @pages = Page.where(featured: true)
      render :featured
    end
    def show
    end
    def display
    end
    def new
      @page = Page.new
    end
    def edit
    end
    def create
      @page = Page.new(page_params)
      if @page.save
        redirect_to @page, notice: 'Page was successfully created.'
      else
        render :new
      end
    end
    def update
      if @page.update(page_params)
        redirect_to @page, notice: 'Page was successfully updated.'
      else
        render :edit
      end
    end
    def destroy
      @page.destroy
      redirect_to pages_url, notice: 'Page was successfully destroyed.'
    end

    private
    def set_categories
      @categories = Category.all
    end
    def set_page
      @page = Page.find(params[:id])
    end
    def page_params
      params.require(:page).permit(:title, :text, :featured,:show_title,:category_id)
    end
  end
end
