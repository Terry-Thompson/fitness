require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

run ApplicationController
use UsersController
use TricepsController
use ShouldersController
use LegsController
use ChestsController
use BicepsController
use BacksController
use AbdominalsController
