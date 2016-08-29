class Admin::ProductAttachmentsController < Admin::BaseController
  def index
    @product_attachments = ProductAttachment.page(params[:page]).per(20)
  end

  def new
    @product_attachment = ProductAttachment.new
  end

  def create
    @product_attachment = ProductAttachment.new params_product_attachment
    @product_attachment.pdf = params[:product_attachment][:pdf]
    if @product_attachment.save
      redirect_to [:admin, :industries]
    else
      render 'new'
    end
  end

  def edit
    @product_attachment = ProductAttachment.find params[:id]
  end

  def update
    @product_attachment = ProductAttachment.find params[:id]
    if @product_attachment.update_attributes params_product_attachment
      redirect_to [:admin, :product_attachments]
    else
      render 'edit'
    end
  end

  private
  def params_product_attachment
    params.require(:product_attachment).permit(:name, :note, :pdf_category_id)
  end
end
