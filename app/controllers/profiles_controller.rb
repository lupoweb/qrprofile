class ProfilesController < ApplicationController
  def index
    qrcode = RQRCode::QRCode.new("http://github.com/#{current_user.nickname}")

    # NOTE: showing with default options specified explicitly
    @svg = qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 11,
      standalone: true,
      use_path: true
    )
  end
end