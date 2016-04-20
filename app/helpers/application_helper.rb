module ApplicationHelper

  # https://gist.github.com/roberto/3344628
  def bootstrap_class_for(flash_type)
    {
        :success => 'alert-success',
        :error => 'alert-danger',
        :danger => 'alert-danger',
        :alert => 'alert-warning',
        :warning => 'alert-warning',
        :warn => 'alert-warning',
        :notice => 'alert-info',
        :info => 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

end
