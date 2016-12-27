class MetalsController < ApplicationController
   
   def new
      @metal = Metal.new
   end
   
   def create
      @metal = Metal.new(metal_params)
      if @metal.save
         flash[:success] = 'Successfully Added new Metal'
         redirect_to metal_path(@metal)
      else
         render 'new'
      end
   end
   
   
   def show
      @metal = Metal.find(params[:id])
   end
   
   def index
      @metals = Metal.paginate(page: params[:page], per_page: 3)
   end
   
   def edit
      @metal = Metal.find(params[:id])
   end
   
   def update
      @metal = Metal.find(params[:id])
      if @metal.update(metal_params)
         flash[:success] = "Record has been successfully edited"
         redirect_to metal_path(@metal)
      else
         render 'edit'
      end
   end
   
   def destroy
      @metal = Metal.find(params[:id])
      if @metal.destroy
         flash[:success] = 'Record has been successfully removed'
         redirect_to metals_path
      end
   end
   
   # customised methods and pages
  
  
   #create new pairing
   def pair
      @metal = Metal.find(params[:id])
      @metal_pair = MetalComposite.new
   end
   
   def pairing
      @metal = Metal.find(params[:id])
      @metal_pair = MetalComposite.new(pairing_params)
      
      if validate_metal_composite(@metal_pair)
         @metal_pair.save
         @metal.metal_composite = @metal_pair
         if @metal.save
            flash[:success] = 'successfully matched'
            redirect_to metal_path(@metal)
         else
            render 'pair'
         end
      else
         flash[:danger] = 'The composite added is more than 100. Please calculate again'
         render 'pair'
      end
   end
   
   
   #updating of pairing
   def editPair
      @metal = Metal.find(params[:id])
      @metal_pair = @metal.metal_composite
   end
   
   def updatePair
      @metal = Metal.find(params[:id])
      @metal_pair = @metal.metal_composite
     
      metal_pair_new = MetalComposite.new(pairing_params)
      
      if validate_metal_composite(metal_pair_new)
        @metal_pair.update(pairing_params)
        flash[:success] = 'Composite has been successfully added'
        redirect_to metal_path(@metal)
      else
        flash[:danger] ='The composite added is more or less than 100. Please calculate again.'
        render 'editPair'
      end
   end
   
   
   def search
      if params[:metal]
         @metal = Metal.search_by_name(params[:metal])
      end
      
      if @metal
       render partial: 'lookup'
       else
         render status: :not_found, nothing:true
      end
   end
   
   private
   def metal_params
      params.require(:metal).permit(:name, :metal_code, :metal_category_ids)
   end
   
   def pairing_params
      params.require(:metal_pair).permit(:iron, :calcium, :potassium, :others)
   end
   
   
   def validate_metal_composite(composite)
      total = 0
      composite.attributes.each_pair do |c, d|
         total += d ||= 0
      end
      
      # total = composite.iron ||= 0 + composite.calcium ||= 0  + composite.potassium ||= 0  + composite.others ||= 0
      
      if total != 100
         false
      else
         composite
      end
   end
    
end