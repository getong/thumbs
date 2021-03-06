unit_tests do

  test "Can merge forked branch repo" do
     default_vcr_state do
        prw=Thumbs::PullRequestWorker.new(:repo => 'davidx/prtester', :pr => 323)
        status = prw.try_merge

        assert status.key?(:result)
        assert status.key?(:message)

        assert_equal :ok, status[:result]
        assert_equal status, prw.build_status[:main][:steps][:merge]
     end
  end
end



