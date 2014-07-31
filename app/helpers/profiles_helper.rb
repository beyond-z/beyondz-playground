module ProfilesHelper
  def owned(viewer)
    current_user.id == viewer.id
  end
end
