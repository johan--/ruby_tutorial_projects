class AuthorsAndBooks < Netzke::Basepack::Viewport
  def configure(c)
    super
    c.items = [:authors, :books]
    c.layout = {type: :hbox, align: :stretch}
  end

  component :authors do |c|
    c.flex = 1
  end

  component :books do |c|
    c.columns = [:title, :exemplars, :completed]
    c.flex = 1
  end
end
