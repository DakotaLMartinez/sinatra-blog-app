require './config/environment'

use Rack::MethodOverride

run PostsController
use CommentsController