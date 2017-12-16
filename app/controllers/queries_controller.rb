class QueriesController < ApplicationController
  include QueryHelper

  before_action :authenticate_user!

  def index
    @queries = Query.all
    query = params[:query]
    @queries = @queries.where("lower(query) ~ ?", query.downcase) unless query.blank?
  end

  def show
    @query = Query.find_by_id(params[:id])
    if @query.blank?
      redirect_to queries_path, alert: "Query not found"
      return
    end
    @games = GameInfo.where("api_id IN (?)", @query.games)
    last_queries
  end

  def new
    @query = Query.new
    last_info
  end

  def create
    @query = Query.new(query_params)
    query_in_db = Query.where("lower(query) = ?", @query.query.downcase).first
    if !query_in_db.blank?
      redirect_to query_in_db, notice: 'Query was already present'
    else
      # Make query to api => set of games_info
      @query = search_query(@query)
      @query.query.downcase!
      if !@query.errors.any? && @query.save
        redirect_to @query, notice: 'A new query was added to the database'
      else
        last_info
        render :new
      end
    end
  end

  private
  def query_params
    params.require(:query).permit(:query)
  end

  def last_info
    @games = GameInfo.last(30).reverse
    last_queries
  end

  def last_queries
    @queries = Query.last(50).reverse
  end
end
