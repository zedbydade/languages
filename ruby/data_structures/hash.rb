a = 1
b = 2

{ a:, b: }

def test_value_omission 
  x = 1
  y = 2

  assert_equal({x: 1, y: 2}, {x:, y:})
  assert_equal({one: 1, two: 2}, onw:, two:)
end

private def one = 1 
private def two = 2

response = {code: 200, body: {messsage: 'tuturu'}}

case response 
  in code: 200, body: { message: }
    'tuturu'
  in code: 400 
    'tuturu'
end

def configuration 
  { a:, b:, c: }
end

private def a = {}
private def b = {}
private def c = {}



