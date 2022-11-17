require 'diary'
require 'diary_entry'
require 'todo'
require 'todo_list'
require 'contact_extractor'

RSpec.describe 'integration' do
  describe '#all' do
    it 'outputs all instances of DiaryEntry added to Diary' do
      diary = Diary.new
      entry_1 = DiaryEntry.new('title', 'contents')
      entry_2 = DiaryEntry.new('title2', 'contents2')
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.all).to eq([entry_1, entry_2])
    end
  end

  describe '#list' do
    it 'outputs all instances of Todo added to TodoList' do
      todo_list = TodoList.new
      todo_1 = Todo.new('Walk the dog')
      todo_2 = Todo.new('Get dressed')
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      expect(todo_list.list).to eq([todo_1, todo_2])
    end
  end

  describe '#complete' do
    it 'removes completed Todos from TodoList' do
      todo_list = TodoList.new
      todo_1 = Todo.new('Walk the dog')
      todo_2 = Todo.new('Get dressed')
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.complete(todo_1)
      expect(todo_list.list).to eq([todo_2])
    end

    it 'fails when trying to complete non-existant todos' do
      todo_list = TodoList.new
      todo_1 = Todo.new('Walk the dog')
      todo_2 = Todo.new('Get dressed')
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      expect{ todo_list.complete("Shop for groceries") }.to raise_error "Todo not recognised"
    end
  end

  describe '#reading_time' do
    context 'length of text is easily divisble by wpm' do
      it 'returns reading time in minutes for all given diary entries' do
        diary = Diary.new
        entry_1 = DiaryEntry.new('title', 'contents ' * 200)
        entry_2 = DiaryEntry.new('title2', 'contents ' * 400)
        diary.add(entry_1)
        diary.add(entry_2)
        expect(diary.reading_time(100)).to eq 6
      end
    end

    context 'length of text is not easily divisble by wpm' do
      it 'returns reading time in minutes for all given diary entries' do
        diary = Diary.new
        entry_1 = DiaryEntry.new('title', 'contents ' * 10)
        entry_2 = DiaryEntry.new('title2', 'contents ' * 5)
        diary.add(entry_1)
        diary.add(entry_2)
        expect(diary.reading_time(2)).to eq 8
      end
    end

    it 'fails when wpm is 0' do
      diary = Diary.new
      entry_1 = DiaryEntry.new('title', 'contents ' * 200)
      entry_2 = DiaryEntry.new('title2', 'contents ' * 400)
      diary.add(entry_1)
      diary.add(entry_2)
      expect{ diary.reading_time(0) }.to raise_error "WPM must be positive."
    end
  end

  describe '#find_best_entry_for_reading_time' do
    it 'returns most suitable diary entry for specified reading time' do
      diary = Diary.new
      entry_1 = DiaryEntry.new('title', 'contents ' * 200)
      entry_2 = DiaryEntry.new('title2', 'contents2 ' * 400)
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.find_best_entry_for_reading_time(200,2)).to eq(entry_2)
    end
  end

  describe '#diary_searcher' do
    it 'returns all contact numbers within diary entries' do
      diary = Diary.new 
      entry_1 = DiaryEntry.new('title1', 'I rang 07123456345')
      entry_2 = DiaryEntry.new('title2', 'the number 07234234234 called me')
      entry_3 = DiaryEntry.new('title3', '07555444333 texted her')
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      contact_list = ContactExtractor.new(diary)
      expect(contact_list.diary_searcher).to eq [
        '07123456345',
        '07234234234',
        '07555444333'
      ]
    end

    it 'returns empty array if diary is empty' do
      diary = Diary.new 
      contact_list = ContactExtractor.new(diary) 
      expect(contact_list.diary_searcher).to eq []
    end
  end
end