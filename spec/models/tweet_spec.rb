require 'rails_helper'

describe Tweet do
  describe '#create' do
    context '保存できる状況' do
      it 'タイトル・テキスト・写真が存在すれば保存できる' do
        tweet = build(:tweet)
        expect(tweet).to be_valid
      end
    end

    context '保存できない状況' do
      it 'タイトルがない場合保存されない' do
        tweet = build(:tweet, name: nil)
        tweet.valid?
        expect(tweet.errors[:name]).to include("can't be blank")
      end

      it 'テキストがない場合保存されない' do
        tweet = build(:tweet, text: nil)
        tweet.valid?
        expect(tweet.errors[:text]).to include("can't be blank")
      end

      it '写真がない場合保存されない' do
        tweet = build(:tweet, image: nil)
        tweet.valid?
        expect(tweet.errors[:image]).to include("can't be blank")
      end
    end
  end
end
