class MetalCategoriesController < ApplicationController
   
   def new
      @metal_category = MetalCategory.new
   end
   
   def create
      @metal_category = MetalCategory.new(metal_category_params)
      if @metal_category.save
         flash[:success] = 'Category has been successfully added'
         redirect_to metal_category_path(@metal_category)
      else
         render 'new'
      end
   
   end
   
   def show
       @metal_category = MetalCategory.find(params[:id])
       @metals = @metal_category.metals.paginate(page: params[:page], per_page: 3)
   end
   
   def index
       @metal_categories = MetalCategory.paginate(page: params[:page], per_page: 3)
   end
   
   def edit
       @metal_category = MetalCategory.find(params[:id])
   end
   
   def update
      @metal_category = MetalCategory.find(params[:id])
      
      if @metal_category.update(metal_category_params)
         flash[:success] = 'Record has been successfully updated'
         redirect_to metal_category_path(@metal_category)
      else
         render 'edit'
      end
       
   end
   
   private 
   def metal_category_params
      params.require(:metal_category).permit(:name)
   end
    
end