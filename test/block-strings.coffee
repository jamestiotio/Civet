{testCase} = require "./helper"

describe "block strings", ->
  testCase '''
    basic
    ---
    x = """
      hello
    """
    ---
    x = `hello`;
  '''


  testCase '''
    multi-line indented
    ---
    x = """
      hello
      there
    """
    ---
    x = `hello
    there`;
  '''

  # NOTE: a case could be made that this should have indentation removed
  testCase '''
    non-indented
    ---
    x = """hello
      there
    """
    ---
    x = `hello
      there`;
  '''

  # NOTE: since this is in a string it needs double \\ to escape the "
  testCase '''
    escapes
    ---
    x = """
      hello""\\"
    """
    ---
    x = `hello""\\"`;
  '''