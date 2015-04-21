require "open3"

class Api::V1::DirectoriesController < ApplicationController
  def list
    Open3.popen3("ls", directory) do |stdin, stdout, stderr, wait_thr|
      error = stderr.gets
      if error.nil?
        render json: stdout.readlines.map(&:chomp)
      else
        render json: { error: error }, status: :bad_request
      end
    end
  end
  
  private
  
  def directory
    params.permit(:directory)[:directory]
  end
end