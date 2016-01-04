class AppError < ActiveRecord::Base
  attr_accessible :where, :backtrace, :message

  bs_admin do |c|
    c.can [:view]
    c.fields do |f|
      f.string :where
      f.string :message
      f.text :backtrace
    end

    c.title_field :where
    c.index_fields [:where, :message, :created_at]

    c.sort 'created_at DESC'
    c.filter :string, :where
    c.filter :string, :message

    c.populate_batch_count 5..20

    c.paginate 50
  end

  def self.create_from_exception where, exception
    AppError.create where: where, message: exception.message, backtrace: exception.backtrace
  end
end
