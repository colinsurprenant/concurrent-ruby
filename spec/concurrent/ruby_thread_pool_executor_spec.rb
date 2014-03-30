#require 'spec_helper'
#require_relative 'cached_thread_pool_shared'
#require_relative 'fixed_thread_pool_shared'
#
#module Concurrent
#
#  describe RubyThreadPoolExecutor do
#
#    after(:each) do
#      subject.kill
#      sleep(0.1)
#    end
#
#    context 'cached thread pool emulation' do
#
#      let(:described_class) do
#        Class.new(RubyThreadPoolExecutor) do
#          def initialize(opts = {})
#            max_length = opts.fetch(:max_threads, RubyThreadPoolExecutor::DEFAULT_MAX_POOL_SIZE).to_i
#            idletime = opts.fetch(:idletime, RubyThreadPoolExecutor::DEFAULT_THREAD_IDLETIMEOUT).to_i
#            raise ArgumentError.new('idletime must be greater than zero') if idletime <= 0
#            raise ArgumentError.new('max_threads must be greater than zero') if max_length <= 0
#            super(opts)
#          end
#        end
#      end
#
#      subject { described_class.new(max_threads: 5) }
#
#      it_should_behave_like :cached_thread_pool
#    end
#
#    context 'fixed thread pool emulation' do
#
#      let(:described_class) do
#        Class.new(RubyThreadPoolExecutor) do
#          def initialize(max_threads)
#            super(min_threads: max_threads, max_threads: max_threads, idletime: 0)
#          end
#        end
#      end
#
#      subject { described_class.new(max_threads: 5) }
#
#      it_should_behave_like :fixed_thread_pool
#    end
#  end
#end