require "spec_helper"

context "after provision finishes" do
  [:server1, :server2].each do |sym|
    describe server(sym) do
      it "builds ports-mgmt/portmaster" do
        result = current_server.ssh_exec "sudo poudriere bulk -p mini -j 11_2 -C ports-mgmt/portmaster && echo SUCCESSFULL_BIULD"
        expect(result).to match(/SUCCESSFULL_BIULD/)
      end
    end
  end
end
