require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
    # assert_select "h1", "Posts"  # verifico que la página contiene un título de "Posts"
    # assert_select "p", @post.content  # verifico que el contenido del post esté presente en la página
  end

  test "should get new" do
    sign_in users(:one)
    get new_post_url
    assert_response :success
    # assert_select "form"  # verifico que la página contiene un formulario para crear un nuevo post
  end

  test "should create post" do
    sign_in users(:one)
    assert_difference("Post.count") do
      post posts_url, params: { post: { available: @post.available, content: @post.content, title: @post.title } }
    end

    assert_redirected_to post_url(Post.last)
    # follow_redirect!
    # assert_select "strong", "Title:"  # verifico que el nuevo post muestra su título
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
    # assert_select "strong", "Title:"  # verifico que el título del post se muestra en la página
  end

  test "should get edit" do
    sign_in users(:one)
    get edit_post_url(@post)
    assert_response :success
    # assert_select "form"  # verifico que la página de edición contiene un formulario
  end

  test "should update post" do
    sign_in users(:one)
    patch post_url(@post), params: { post: { available: @post.available, content: @post.content, title: @post.title } }
    assert_redirected_to post_url(@post)
    # follow_redirect!
    # assert_select "strong", "Title:"  # verifico que el post actualizado muestra su título
    # assert_select "p", "Contenido actualizado"  # verifico que el contenido actualizado esté presente
  end

  test "should destroy post" do
    sign_in users(:one)
    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
