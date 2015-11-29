class PagesController < ApplicationController
  before_filter :login_required, :except => [:show]
  before_filter :tagcloud

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
    posst=Post.tagged_with(@page.title)
    @posts=posst.sort_by { |k| k['created_at'] }
    @posts.reverse!
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Successfully created page."
      redirect_to calculate_importance_path
    else
      render :action => 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Successfully updated page."
      redirect_to @page
    else
      render :action => 'edit'
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Successfully destroyed page."
    redirect_to pages_url
  end

  def calculate_importance
    @pages=Page.all
    hier=Array.new #lag sortert hierarki
    @pages.each_with_index do |p,i|
      posts=Post.tagged_with(p.title)

      ex1=0
      posts.each do |po|
        if po.created_at>700.days.ago
          ex1=+1 #addup bonus for last 2 year posts
        end
      end

      ex2=0
      posts.each do |po|
        if po.created_at>165.days.ago
          ex2=+1 #addup bonus for last halfyear posts
        end
      end

      ex3=0
      posts.each do |po|
        if po.created_at>30.days.ago
          ex3=+1 #addup bonus for last month posts
        end
      end

      ekstralengde=posts.length+ex1+ex2+ex3

      hier[i]=[p,ekstralengde] #lagre array med post og antall tags
    end
    sorted = hier.sort_by {|post,length| length} #sorter etter lengde
    sorted = sorted.reverse
    sorted.each_with_index do |p,i|
      if i>10
        p[0].importance=10 #stopp på 10 - minste størrelse
      else
        p[0].importance=i #antall poster knytta til page avgjør basis for importance
      end
      p[0].save #oppdater
    end

    redirect_to root_url
  end

private
  def page_params
    params.require(:page).permit(:title, :content, :clouded, :importance)
  end
end
