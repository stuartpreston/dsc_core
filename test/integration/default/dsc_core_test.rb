unless os.windows? 
  describe file('/tmp/example') do
    its(:content) { should match 'PowerShell Conference Asia 2016' }
  end
end

if os.windows?
  describe file('c:\\example.txt') do
    its(:content) { should match 'PowerShell Conference Asia 2016' }
  end
end
