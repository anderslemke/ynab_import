module YnabImport
  module Csv
    class JyskeBank < Rewriter
      COL_SEP = ";"

      private

        def date
          row[0]
        end

        def payee
          row[2]
        end

        def memo
          nil
        end

        def transaction
          row[4].sub(",", ".").to_f
        end

        def currency
          :DKK
        end
    end
  end
end
