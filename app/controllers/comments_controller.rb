class CommentsController < ApplicationController


 # before_action :set_visitor
   before_action :find_visitor

   before_action :set_comment, only: [ :reply, :edit, :update, :destroy ]

  
  

   #before_action :set_party, only: :create

   


     #before_action :find_group


   # before_action :find_parent

 



 def reply


    @reply = @visitor.comments.build(parent: @comment)

     
  end

  
  def create

      @comment = @visitor.comments.new(comment_params)
     
        
        respond_to do |format|
         
          if @comment.save

            format.html { redirect_to @visitor, notice: "Comment was successfully created."}
            format.json { render json: @comment }
            format.js

        else

             format.html { render :back, notice: "Comment was not created." }
              format.json { render json: @comment.errors }
              format.js

        end

    end
        


  end



   def edit
  end

  def update

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @visitor, notice: "Comment was successfully updated."}
        format.json { render json: @comment }
        format.js
      else
        format.html { render :back, notice: "Comment was not updated." }
        format.json { render json: @comment.errors }
        format.js
      end
    end
  end

  def destroy

    @comment.destroy if @comment.errors.empty?
    respond_to do |format|
      format.html { redirect_to @visitor, notice: "Comments was successfully destroyed."}
      format.json { head :no_content }
      format.js
    end
  end


  private


  def set_comment

    begin

      @comment = @visitor.party.comments.find(params[:id])

    rescue => e

      logger.error "#{e.class.name} : #{e.message}"

        @comment = @visitor.party.comments.build

        @comment.errors.add(:base, :recordnotfound, message: "That record doesn't exist. Maybe, it is already destroyed.")

    end

end





  def find_visitor

      if params[:visitor_id]

         @visitor = Visitor.find(params[:visitor_id])

      end
  end


  def comment_params

    params.require(:comment).permit(:name, :body, :visitor_id, :group_id, :parent_id, :party_id)

  end

  
  def find_group

      if params[:group_id]

         @group = Group.find(params[:group_id])

      end
  end



  def find_parent

      if params[:parent_id]

         @parent = Comment.find(params[:parent_id])

      end
  end


  def all_comments

    @comment = @group.comments

  end

  
  def set_party

           @party = @visitor.party

  end





  def set_visitor

    resource, id = request.path.split('/')[1,2]

    @visitor = resource.singularize.classify.constantize.find(id)

  end



end


