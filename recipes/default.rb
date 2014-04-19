remote_file "/tmp/yum-plugin-s3-iam-#{node['yum-s3-iam']['rpm_version']}.noarch.rpm" do
  source node['yum-s3-iam']['rpm_url']
  action :create_if_missing

  not_if do
    system("rpm -q yum-plugin-s3-iam | grep -q 'yum-plugin-s3-iam-#{node['yum-s3-iam']['rpm_version']}.noarch'")
  end
end

rpm_package 'yum-plugin-s3-iam' do
  action :install
  source "/tmp/yum-plugin-s3-iam-#{node['yum-s3-iam']['rpm_version']}.noarch.rpm"

  not_if do
    system("rpm -q yum-plugin-s3-iam | grep -q 'yum-plugin-s3-iam-#{node['yum-s3-iam']['rpm_version']}.noarch'")
  end
end
