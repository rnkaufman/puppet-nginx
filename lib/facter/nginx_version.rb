Facter.add(:nginx_version) do
  setcode do
    if Facter.value('kernel') != 'windows' && (Facter::Util::Resolution.which('nginx') || Facter::Util::Resolution.which('openresty'))
      nginx_version = Facter::Util::Resolution.exec('nginx -v 2>&1 || openresty -v 2>&1')
      %r{nginx version: (nginx|openresty)\/([\w\.]+)}.match(nginx_version)[2]
    end
  end
end
