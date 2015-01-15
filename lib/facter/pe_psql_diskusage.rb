Facter.add(:pe_psql_diskusage) do
  confine :kernel => 'Linux'
  setcode do
    if File.exists? '/opt/puppet/var/lib/pgsql/'
      dfoutput = Facter::Core::Execution.exec('/bin/df --direct /opt/puppet/var/lib/pgsql/ | tail -1')
      dfarray = dfoutput.split.join(" ").split(" ")
      dfarray[4]
    end
  end
end
