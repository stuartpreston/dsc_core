# Example tests that can be used to verify PowerShell's functionality

unless os.windows? 
  describe command("powershell -command '$PSVersionTable'") do
    its(:stdout) { should match 'PSEdition\s+Core' }
    its(:stdout) { should match 'PSVersion\s+6.0.0-alpha' }
  end
end
