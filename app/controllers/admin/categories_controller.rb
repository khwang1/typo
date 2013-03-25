class Admin::CategoriesController < Admin::BaseController
  cache_sweeper :blog_sweeper

  # The index action is redirected new action
  def index; redirect_to :action => 'new' ; end
  
  # The edit action calls the method new_or_edit
  def edit; new_or_edit;  end

  def new 
    # puts "!!!inside new()"
    
    # instantiates an empty instance of Category, which is passed to form in the view
    @category = Category.new 

    # existing categories are needed in the view for display
    @categories = Category.find(:all)       
    respond_to do |format|
      format.html
      format.js { 
        @category = Category.new
      }
    end
  end

  def destroy
    @record = Category.find(params[:id])
    return(render 'admin/shared/destroy') unless request.post?

    @record.destroy
    redirect_to :action => 'new'
  end

  private

  def new_or_edit
    # puts "!!!inside new_or_edit()"
    @categories = Category.find(:all) #@categories instance variable is needed in 'new' view
  
    if (params[:id].nil? && request.post?)
      # puts "!!! receive Post and params[:id]=#{params[:id]}"

      # recieve a Post with :id nil, thus creating a new category
      @category = Category.new(params[:category])
      save_category
      return
    else
      @category = Category.find(params[:id])
      @category.attributes = params[:category] #empty if this is a not POST from an edit form

      # puts "!!! params[:id]=#{params[:id]}"
      # puts "!!! @category=#{@category}"      
      # puts "!!! params[:category]=#{params[:category]}"
      
      if request.post?
        # this is Post from an edit form
        respond_to do |format|
          format.html { save_category }
          format.js do 
            @category.save
            @article = Article.new
            @article.categories << @category
            return render(:partial => 'admin/content/categories')
          end
        end
        return
      end
            
    end
    render 'new'
  end

  def save_category
    if @category.save!
      flash[:notice] = _('Category was successfully saved.')
    else
      flash[:error] = _('Category could not be saved.')
    end
    redirect_to :action => 'new'
  end

end
