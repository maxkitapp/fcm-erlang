%% logging callbacks

-define(PRINT(Format, Args), ok).

-define(DEBUG(Format, Args), ok).

-define(INFO_MSG(Format, Args), ok).

-define(WARNING_MSG(Format, Args), lager:log(warning, self(), Format, Args)).

-define(ERROR_MSG(Format, Args), lager:log(error, self(), Format, Args)).

-define(CRITICAL_MSG(Format, Args), lager:log(critical, self(), Format, Args)).
