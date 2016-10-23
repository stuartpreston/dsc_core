execute 'Set !require tty for azure user' do
  action :run
  command 'echo "Defaults!ALL !requiretty" >> /etc/sudoers.d/azure'
  not_if 'grep "Defaults!ALL !requiretty" /etc/sudoers.d/azure'
end
