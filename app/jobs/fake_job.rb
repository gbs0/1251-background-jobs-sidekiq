class FakeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Estou começando o trabalho"
    sleep 5
    puts "Trabalho finalizado!"
  end
end
