class Books < Netzke::Basepack::Grid
  def configure(c)
    c.columns = [
      # you may configure columns inline like this:
      { name: :author__name, text: "Author" },

      :title,
      :exemplars,
      :completed
    ]

    c.model = "Book"

    # which buttons to show in the bottom toolbar

    c.bbar = [:add, :edit, :del, '->', :apply]

    super
  end
end
