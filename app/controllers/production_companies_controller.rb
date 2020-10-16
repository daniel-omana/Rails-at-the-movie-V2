class ProductionCompaniesController < ApplicationController
  def index
    @production_companies = ProductionCompany.ordered_by_movies
  end

  # SELECT COUNT(production_companies.id), production_companies.id, production_companies.name
  # FROM "production_companies"
  # LEFT OUTER JOIN "movies"
  # 	ON "movies"."production_company_id" = "production_companies"."id"
  # GROUP BY production_companies.id;

  def show
    @production_company = ProductionCompany.find(params[:id])
  end
end
