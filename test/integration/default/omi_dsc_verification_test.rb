# Tests that can be used to verify the installation of OMI (Linux) and DSC

unless os.windows? 
  describe file('/opt/omi/bin/omiserver') do
    it { should exist }
  end

  describe file('/opt/microsoft/dsc/Scripts/GetDscConfiguration.py') do
    it { should exist }
  end
end
