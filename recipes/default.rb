file = remote_file "/tmp/yum-plugin-s3-iam-#{node['yum-s3-iam']['rpm_version']}.noarch.rpm" do
  source node['yum-s3-iam']['rpm_url']
  action :nothing

  not_if do
    system("rpm -q yum-plugin-s3-iam | grep -q 'yum-plugin-s3-iam-#{node['yum-s3-iam']['rpm_version']}.noarch'")
  end
end

file.run_action(:create_if_missing)

package = rpm_package 'yum-plugin-s3-iam' do
  action :nothing
  source "/tmp/yum-plugin-s3-iam-#{node['yum-s3-iam']['rpm_version']}.noarch.rpm"

  not_if do
    system("rpm -q yum-plugin-s3-iam | grep -q 'yum-plugin-s3-iam-#{node['yum-s3-iam']['rpm_version']}.noarch'")
  end
end

package.run_action(:install)
