select count(*) =31 as check,
          min(generated_date) as check1,
          max(generated_date) as check2
      from v_generated_dates;