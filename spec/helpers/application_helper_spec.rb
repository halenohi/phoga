require 'spec_helper'

describe ApplicationHelper do
  describe '#active_class' do
    before do
      helper.stub_chain(:request, :path).and_return('/hoge/foo')
    end

    context 'lefthand_matchオプションをtrueにした場合' do
      it '対象のpathが現在のrequest.pathと前方一致したら" active "という文字列をかえすこと' do
        expect(helper.active_class('/hoge', { lefthand_match: true })).to eq(' active ')
      end

      it '対象のpathが現在のrequest.pathと一致しなかったら空文字列をかえすこと' do
        expect(helper.active_class('/hoge/fuga', { lefthand_match: true })).to eq('')
      end
    end

    context 'lefthand_matchオプションをつけなかった場合' do
      it '対象のpathが現在のrequest.pathと完全一致したら" active "という文字列をかえすこと' do
        expect(helper.active_class('/hoge/foo')).to eq(' active ')
      end

      it '対象のpathが現在のrequest.pathと完全一致しなかったら空文字列をかえすこと' do
        expect(helper.active_class('/hoge')).to eq('')
      end
    end
  end
end
