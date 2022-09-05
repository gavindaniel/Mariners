# This code parses date/times, so please
#
#     pip install python-dateutil
#
# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = day_boxscore_from_dict(json.loads(json_string))

from enum import Enum
from uuid import UUID
from typing import Any, List, Optional, Union, TypeVar, Callable, Type, cast
from datetime import datetime
import dateutil.parser


T = TypeVar("T")
EnumT = TypeVar("EnumT", bound=Enum)


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
    return x


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def from_list(f: Callable[[Any], T], x: Any) -> List[T]:
    assert isinstance(x, list)
    return [f(y) for y in x]


def to_enum(c: Type[EnumT], x: Any) -> EnumT:
    assert isinstance(x, c)
    return x.value


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


def from_none(x: Any) -> Any:
    assert x is None
    return x


def from_union(fs, x):
    for f in fs:
        try:
            return f(x)
        except:
            pass
    assert False


def from_float(x: Any) -> float:
    assert isinstance(x, (float, int)) and not isinstance(x, bool)
    return float(x)


def to_float(x: Any) -> float:
    assert isinstance(x, float)
    return x


def from_datetime(x: Any) -> datetime:
    return dateutil.parser.parse(x)


def from_bool(x: Any) -> bool:
    assert isinstance(x, bool)
    return x


class HitterOutcome(Enum):
    A_D = "aD"
    A_HR = "aHR"
    A_S = "aS"
    A_SAD2 = "aSAD2"
    B_B = "bB"
    O_FC = "oFC"
    O_SF = "oSF"


class InningHalf(Enum):
    B = "B"
    T = "T"


class Runner:
    starting_base: int
    first_name: str
    last_name: str
    preferred_name: str
    jersey_number: int
    id: UUID

    def __init__(self, starting_base: int, first_name: str, last_name: str, preferred_name: str, jersey_number: int, id: UUID) -> None:
        self.starting_base = starting_base
        self.first_name = first_name
        self.last_name = last_name
        self.preferred_name = preferred_name
        self.jersey_number = jersey_number
        self.id = id

    @staticmethod
    def from_dict(obj: Any) -> 'Runner':
        assert isinstance(obj, dict)
        starting_base = from_int(obj.get("starting_base"))
        first_name = from_str(obj.get("first_name"))
        last_name = from_str(obj.get("last_name"))
        preferred_name = from_str(obj.get("preferred_name"))
        jersey_number = int(from_str(obj.get("jersey_number")))
        id = UUID(obj.get("id"))
        return Runner(starting_base, first_name, last_name, preferred_name, jersey_number, id)

    def to_dict(self) -> dict:
        result: dict = {}
        result["starting_base"] = from_int(self.starting_base)
        result["first_name"] = from_str(self.first_name)
        result["last_name"] = from_str(self.last_name)
        result["preferred_name"] = from_str(self.preferred_name)
        result["jersey_number"] = from_str(str(self.jersey_number))
        result["id"] = str(self.id)
        return result


class EventType(Enum):
    PITCH = "pitch"


class Event:
    hitter_id: UUID
    pitcher_id: UUID
    inning: int
    inning_half: InningHalf
    type: EventType
    hitter_outcome: HitterOutcome
    id: UUID
    runners: List[Runner]

    def __init__(self, hitter_id: UUID, pitcher_id: UUID, inning: int, inning_half: InningHalf, type: EventType, hitter_outcome: HitterOutcome, id: UUID, runners: List[Runner]) -> None:
        self.hitter_id = hitter_id
        self.pitcher_id = pitcher_id
        self.inning = inning
        self.inning_half = inning_half
        self.type = type
        self.hitter_outcome = hitter_outcome
        self.id = id
        self.runners = runners

    @staticmethod
    def from_dict(obj: Any) -> 'Event':
        assert isinstance(obj, dict)
        hitter_id = UUID(obj.get("hitter_id"))
        pitcher_id = UUID(obj.get("pitcher_id"))
        inning = from_int(obj.get("inning"))
        inning_half = InningHalf(obj.get("inning_half"))
        type = EventType(obj.get("type"))
        hitter_outcome = HitterOutcome(obj.get("hitter_outcome"))
        id = UUID(obj.get("id"))
        runners = from_list(Runner.from_dict, obj.get("runners"))
        return Event(hitter_id, pitcher_id, inning, inning_half, type, hitter_outcome, id, runners)

    def to_dict(self) -> dict:
        result: dict = {}
        result["hitter_id"] = str(self.hitter_id)
        result["pitcher_id"] = str(self.pitcher_id)
        result["inning"] = from_int(self.inning)
        result["inning_half"] = to_enum(InningHalf, self.inning_half)
        result["type"] = to_enum(EventType, self.type)
        result["hitter_outcome"] = to_enum(HitterOutcome, self.hitter_outcome)
        result["id"] = str(self.id)
        result["runners"] = from_list(lambda x: to_class(Runner, x), self.runners)
        return result


class Pitcher:
    preferred_name: str
    first_name: str
    last_name: str
    jersey_number: int
    id: UUID
    win: Optional[int]
    loss: Optional[int]
    era: Optional[float]

    def __init__(self, preferred_name: str, first_name: str, last_name: str, jersey_number: int, id: UUID, win: Optional[int], loss: Optional[int], era: Optional[float]) -> None:
        self.preferred_name = preferred_name
        self.first_name = first_name
        self.last_name = last_name
        self.jersey_number = jersey_number
        self.id = id
        self.win = win
        self.loss = loss
        self.era = era

    @staticmethod
    def from_dict(obj: Any) -> 'Pitcher':
        assert isinstance(obj, dict)
        preferred_name = from_str(obj.get("preferred_name"))
        first_name = from_str(obj.get("first_name"))
        last_name = from_str(obj.get("last_name"))
        jersey_number = int(from_str(obj.get("jersey_number")))
        id = UUID(obj.get("id"))
        win = from_union([from_int, from_none], obj.get("win"))
        loss = from_union([from_int, from_none], obj.get("loss"))
        era = from_union([from_float, from_none], obj.get("era"))
        return Pitcher(preferred_name, first_name, last_name, jersey_number, id, win, loss, era)

    def to_dict(self) -> dict:
        result: dict = {}
        result["preferred_name"] = from_str(self.preferred_name)
        result["first_name"] = from_str(self.first_name)
        result["last_name"] = from_str(self.last_name)
        result["jersey_number"] = from_str(str(self.jersey_number))
        result["id"] = str(self.id)
        result["win"] = from_union([from_int, from_none], self.win)
        result["loss"] = from_union([from_int, from_none], self.loss)
        result["era"] = from_union([to_float, from_none], self.era)
        return result


class ScoringType(Enum):
    INNING = "inning"


class AwayScoring:
    number: int
    sequence: int
    runs: int
    hits: int
    errors: int
    type: ScoringType

    def __init__(self, number: int, sequence: int, runs: int, hits: int, errors: int, type: ScoringType) -> None:
        self.number = number
        self.sequence = sequence
        self.runs = runs
        self.hits = hits
        self.errors = errors
        self.type = type

    @staticmethod
    def from_dict(obj: Any) -> 'AwayScoring':
        assert isinstance(obj, dict)
        number = from_int(obj.get("number"))
        sequence = from_int(obj.get("sequence"))
        runs = from_int(obj.get("runs"))
        hits = from_int(obj.get("hits"))
        errors = from_int(obj.get("errors"))
        type = ScoringType(obj.get("type"))
        return AwayScoring(number, sequence, runs, hits, errors, type)

    def to_dict(self) -> dict:
        result: dict = {}
        result["number"] = from_int(self.number)
        result["sequence"] = from_int(self.sequence)
        result["runs"] = from_int(self.runs)
        result["hits"] = from_int(self.hits)
        result["errors"] = from_int(self.errors)
        result["type"] = to_enum(ScoringType, self.type)
        return result


class Away:
    name: str
    market: str
    abbr: str
    id: UUID
    runs: int
    hits: int
    errors: int
    win: int
    loss: int
    probable_pitcher: Pitcher
    starting_pitcher: Pitcher
    scoring: List[AwayScoring]
    events: Optional[List[Event]]

    def __init__(self, name: str, market: str, abbr: str, id: UUID, runs: int, hits: int, errors: int, win: int, loss: int, probable_pitcher: Pitcher, starting_pitcher: Pitcher, scoring: List[AwayScoring], events: Optional[List[Event]]) -> None:
        self.name = name
        self.market = market
        self.abbr = abbr
        self.id = id
        self.runs = runs
        self.hits = hits
        self.errors = errors
        self.win = win
        self.loss = loss
        self.probable_pitcher = probable_pitcher
        self.starting_pitcher = starting_pitcher
        self.scoring = scoring
        self.events = events

    @staticmethod
    def from_dict(obj: Any) -> 'Away':
        assert isinstance(obj, dict)
        name = from_str(obj.get("name"))
        market = from_str(obj.get("market"))
        abbr = from_str(obj.get("abbr"))
        id = UUID(obj.get("id"))
        runs = from_int(obj.get("runs"))
        hits = from_int(obj.get("hits"))
        errors = from_int(obj.get("errors"))
        win = from_int(obj.get("win"))
        loss = from_int(obj.get("loss"))
        probable_pitcher = Pitcher.from_dict(obj.get("probable_pitcher"))
        starting_pitcher = Pitcher.from_dict(obj.get("starting_pitcher"))
        scoring = from_list(AwayScoring.from_dict, obj.get("scoring"))
        events = from_union([lambda x: from_list(Event.from_dict, x), from_none], obj.get("events"))
        return Away(name, market, abbr, id, runs, hits, errors, win, loss, probable_pitcher, starting_pitcher, scoring, events)

    def to_dict(self) -> dict:
        result: dict = {}
        result["name"] = from_str(self.name)
        result["market"] = from_str(self.market)
        result["abbr"] = from_str(self.abbr)
        result["id"] = str(self.id)
        result["runs"] = from_int(self.runs)
        result["hits"] = from_int(self.hits)
        result["errors"] = from_int(self.errors)
        result["win"] = from_int(self.win)
        result["loss"] = from_int(self.loss)
        result["probable_pitcher"] = to_class(Pitcher, self.probable_pitcher)
        result["starting_pitcher"] = to_class(Pitcher, self.starting_pitcher)
        result["scoring"] = from_list(lambda x: to_class(AwayScoring, x), self.scoring)
        result["events"] = from_union([lambda x: from_list(lambda x: to_class(Event, x), x), from_none], self.events)
        return result


class Broadcast:
    network: str

    def __init__(self, network: str) -> None:
        self.network = network

    @staticmethod
    def from_dict(obj: Any) -> 'Broadcast':
        assert isinstance(obj, dict)
        network = from_str(obj.get("network"))
        return Broadcast(network)

    def to_dict(self) -> dict:
        result: dict = {}
        result["network"] = from_str(self.network)
        return result


class Final:
    inning: int
    inning_half: InningHalf

    def __init__(self, inning: int, inning_half: InningHalf) -> None:
        self.inning = inning
        self.inning_half = inning_half

    @staticmethod
    def from_dict(obj: Any) -> 'Final':
        assert isinstance(obj, dict)
        inning = from_int(obj.get("inning"))
        inning_half = InningHalf(obj.get("inning_half"))
        return Final(inning, inning_half)

    def to_dict(self) -> dict:
        result: dict = {}
        result["inning"] = from_int(self.inning)
        result["inning_half"] = to_enum(InningHalf, self.inning_half)
        return result


class HomeScoring:
    number: int
    sequence: int
    runs: Union[int, str]
    hits: Union[int, str]
    errors: Union[int, str]
    type: ScoringType

    def __init__(self, number: int, sequence: int, runs: Union[int, str], hits: Union[int, str], errors: Union[int, str], type: ScoringType) -> None:
        self.number = number
        self.sequence = sequence
        self.runs = runs
        self.hits = hits
        self.errors = errors
        self.type = type

    @staticmethod
    def from_dict(obj: Any) -> 'HomeScoring':
        assert isinstance(obj, dict)
        number = from_int(obj.get("number"))
        sequence = from_int(obj.get("sequence"))
        runs = from_union([from_int, from_str], obj.get("runs"))
        hits = from_union([from_int, from_str], obj.get("hits"))
        errors = from_union([from_int, from_str], obj.get("errors"))
        type = ScoringType(obj.get("type"))
        return HomeScoring(number, sequence, runs, hits, errors, type)

    def to_dict(self) -> dict:
        result: dict = {}
        result["number"] = from_int(self.number)
        result["sequence"] = from_int(self.sequence)
        result["runs"] = from_union([from_int, from_str], self.runs)
        result["hits"] = from_union([from_int, from_str], self.hits)
        result["errors"] = from_union([from_int, from_str], self.errors)
        result["type"] = to_enum(ScoringType, self.type)
        return result


class Home:
    name: str
    market: str
    abbr: str
    id: UUID
    runs: int
    hits: int
    errors: int
    win: int
    loss: int
    probable_pitcher: Pitcher
    starting_pitcher: Pitcher
    scoring: List[HomeScoring]
    events: Optional[List[Event]]

    def __init__(self, name: str, market: str, abbr: str, id: UUID, runs: int, hits: int, errors: int, win: int, loss: int, probable_pitcher: Pitcher, starting_pitcher: Pitcher, scoring: List[HomeScoring], events: Optional[List[Event]]) -> None:
        self.name = name
        self.market = market
        self.abbr = abbr
        self.id = id
        self.runs = runs
        self.hits = hits
        self.errors = errors
        self.win = win
        self.loss = loss
        self.probable_pitcher = probable_pitcher
        self.starting_pitcher = starting_pitcher
        self.scoring = scoring
        self.events = events

    @staticmethod
    def from_dict(obj: Any) -> 'Home':
        assert isinstance(obj, dict)
        name = from_str(obj.get("name"))
        market = from_str(obj.get("market"))
        abbr = from_str(obj.get("abbr"))
        id = UUID(obj.get("id"))
        runs = from_int(obj.get("runs"))
        hits = from_int(obj.get("hits"))
        errors = from_int(obj.get("errors"))
        win = from_int(obj.get("win"))
        loss = from_int(obj.get("loss"))
        probable_pitcher = Pitcher.from_dict(obj.get("probable_pitcher"))
        starting_pitcher = Pitcher.from_dict(obj.get("starting_pitcher"))
        scoring = from_list(HomeScoring.from_dict, obj.get("scoring"))
        events = from_union([lambda x: from_list(Event.from_dict, x), from_none], obj.get("events"))
        return Home(name, market, abbr, id, runs, hits, errors, win, loss, probable_pitcher, starting_pitcher, scoring, events)

    def to_dict(self) -> dict:
        result: dict = {}
        result["name"] = from_str(self.name)
        result["market"] = from_str(self.market)
        result["abbr"] = from_str(self.abbr)
        result["id"] = str(self.id)
        result["runs"] = from_int(self.runs)
        result["hits"] = from_int(self.hits)
        result["errors"] = from_int(self.errors)
        result["win"] = from_int(self.win)
        result["loss"] = from_int(self.loss)
        result["probable_pitcher"] = to_class(Pitcher, self.probable_pitcher)
        result["starting_pitcher"] = to_class(Pitcher, self.starting_pitcher)
        result["scoring"] = from_list(lambda x: to_class(HomeScoring, x), self.scoring)
        result["events"] = from_union([lambda x: from_list(lambda x: to_class(Event, x), x), from_none], self.events)
        return result


class Position(Enum):
    P = "P"


class PrimaryPosition(Enum):
    RP = "RP"
    SP = "SP"


class Status(Enum):
    A = "A"


class Loss:
    preferred_name: str
    first_name: str
    last_name: str
    jersey_number: int
    status: Status
    position: Position
    primary_position: PrimaryPosition
    id: UUID
    win: int
    loss: int
    save: int
    hold: int
    blown_save: int

    def __init__(self, preferred_name: str, first_name: str, last_name: str, jersey_number: int, status: Status, position: Position, primary_position: PrimaryPosition, id: UUID, win: int, loss: int, save: int, hold: int, blown_save: int) -> None:
        self.preferred_name = preferred_name
        self.first_name = first_name
        self.last_name = last_name
        self.jersey_number = jersey_number
        self.status = status
        self.position = position
        self.primary_position = primary_position
        self.id = id
        self.win = win
        self.loss = loss
        self.save = save
        self.hold = hold
        self.blown_save = blown_save

    @staticmethod
    def from_dict(obj: Any) -> 'Loss':
        assert isinstance(obj, dict)
        preferred_name = from_str(obj.get("preferred_name"))
        first_name = from_str(obj.get("first_name"))
        last_name = from_str(obj.get("last_name"))
        jersey_number = int(from_str(obj.get("jersey_number")))
        status = Status(obj.get("status"))
        position = Position(obj.get("position"))
        primary_position = PrimaryPosition(obj.get("primary_position"))
        id = UUID(obj.get("id"))
        win = from_int(obj.get("win"))
        loss = from_int(obj.get("loss"))
        save = from_int(obj.get("save"))
        hold = from_int(obj.get("hold"))
        blown_save = from_int(obj.get("blown_save"))
        return Loss(preferred_name, first_name, last_name, jersey_number, status, position, primary_position, id, win, loss, save, hold, blown_save)

    def to_dict(self) -> dict:
        result: dict = {}
        result["preferred_name"] = from_str(self.preferred_name)
        result["first_name"] = from_str(self.first_name)
        result["last_name"] = from_str(self.last_name)
        result["jersey_number"] = from_str(str(self.jersey_number))
        result["status"] = to_enum(Status, self.status)
        result["position"] = to_enum(Position, self.position)
        result["primary_position"] = to_enum(PrimaryPosition, self.primary_position)
        result["id"] = str(self.id)
        result["win"] = from_int(self.win)
        result["loss"] = from_int(self.loss)
        result["save"] = from_int(self.save)
        result["hold"] = from_int(self.hold)
        result["blown_save"] = from_int(self.blown_save)
        return result


class Pitching:
    win: Loss
    loss: Loss
    save: Optional[Loss]
    hold: Optional[List[Loss]]
    blown_save: Optional[List[Loss]]

    def __init__(self, win: Loss, loss: Loss, save: Optional[Loss], hold: Optional[List[Loss]], blown_save: Optional[List[Loss]]) -> None:
        self.win = win
        self.loss = loss
        self.save = save
        self.hold = hold
        self.blown_save = blown_save

    @staticmethod
    def from_dict(obj: Any) -> 'Pitching':
        assert isinstance(obj, dict)
        win = Loss.from_dict(obj.get("win"))
        loss = Loss.from_dict(obj.get("loss"))
        save = from_union([Loss.from_dict, from_none], obj.get("save"))
        hold = from_union([lambda x: from_list(Loss.from_dict, x), from_none], obj.get("hold"))
        blown_save = from_union([lambda x: from_list(Loss.from_dict, x), from_none], obj.get("blown_save"))
        return Pitching(win, loss, save, hold, blown_save)

    def to_dict(self) -> dict:
        result: dict = {}
        result["win"] = to_class(Loss, self.win)
        result["loss"] = to_class(Loss, self.loss)
        result["save"] = from_union([lambda x: to_class(Loss, x), from_none], self.save)
        result["hold"] = from_union([lambda x: from_list(lambda x: to_class(Loss, x), x), from_none], self.hold)
        result["blown_save"] = from_union([lambda x: from_list(lambda x: to_class(Loss, x), x), from_none], self.blown_save)
        return result


class Location:
    lat: str
    lng: str

    def __init__(self, lat: str, lng: str) -> None:
        self.lat = lat
        self.lng = lng

    @staticmethod
    def from_dict(obj: Any) -> 'Location':
        assert isinstance(obj, dict)
        lat = from_str(obj.get("lat"))
        lng = from_str(obj.get("lng"))
        return Location(lat, lng)

    def to_dict(self) -> dict:
        result: dict = {}
        result["lat"] = from_str(self.lat)
        result["lng"] = from_str(self.lng)
        return result


class Venue:
    name: str
    market: str
    capacity: int
    surface: str
    address: str
    city: str
    state: str
    zip: str
    country: str
    id: UUID
    field_orientation: str
    stadium_type: str
    location: Location

    def __init__(self, name: str, market: str, capacity: int, surface: str, address: str, city: str, state: str, zip: str, country: str, id: UUID, field_orientation: str, stadium_type: str, location: Location) -> None:
        self.name = name
        self.market = market
        self.capacity = capacity
        self.surface = surface
        self.address = address
        self.city = city
        self.state = state
        self.zip = zip
        self.country = country
        self.id = id
        self.field_orientation = field_orientation
        self.stadium_type = stadium_type
        self.location = location

    @staticmethod
    def from_dict(obj: Any) -> 'Venue':
        assert isinstance(obj, dict)
        name = from_str(obj.get("name"))
        market = from_str(obj.get("market"))
        capacity = from_int(obj.get("capacity"))
        surface = from_str(obj.get("surface"))
        address = from_str(obj.get("address"))
        city = from_str(obj.get("city"))
        state = from_str(obj.get("state"))
        zip = from_str(obj.get("zip"))
        country = from_str(obj.get("country"))
        id = UUID(obj.get("id"))
        field_orientation = from_str(obj.get("field_orientation"))
        stadium_type = from_str(obj.get("stadium_type"))
        location = Location.from_dict(obj.get("location"))
        return Venue(name, market, capacity, surface, address, city, state, zip, country, id, field_orientation, stadium_type, location)

    def to_dict(self) -> dict:
        result: dict = {}
        result["name"] = from_str(self.name)
        result["market"] = from_str(self.market)
        result["capacity"] = from_int(self.capacity)
        result["surface"] = from_str(self.surface)
        result["address"] = from_str(self.address)
        result["city"] = from_str(self.city)
        result["state"] = from_str(self.state)
        result["zip"] = from_str(self.zip)
        result["country"] = from_str(self.country)
        result["id"] = str(self.id)
        result["field_orientation"] = from_str(self.field_orientation)
        result["stadium_type"] = from_str(self.stadium_type)
        result["location"] = to_class(Location, self.location)
        return result


class Wind:
    speed_mph: int
    direction: str

    def __init__(self, speed_mph: int, direction: str) -> None:
        self.speed_mph = speed_mph
        self.direction = direction

    @staticmethod
    def from_dict(obj: Any) -> 'Wind':
        assert isinstance(obj, dict)
        speed_mph = from_int(obj.get("speed_mph"))
        direction = from_str(obj.get("direction"))
        return Wind(speed_mph, direction)

    def to_dict(self) -> dict:
        result: dict = {}
        result["speed_mph"] = from_int(self.speed_mph)
        result["direction"] = from_str(self.direction)
        return result


class CurrentConditions:
    temp_f: int
    condition: str
    humidity: int
    dew_point_f: int
    cloud_cover: int
    obs_time: datetime
    wind: Wind

    def __init__(self, temp_f: int, condition: str, humidity: int, dew_point_f: int, cloud_cover: int, obs_time: datetime, wind: Wind) -> None:
        self.temp_f = temp_f
        self.condition = condition
        self.humidity = humidity
        self.dew_point_f = dew_point_f
        self.cloud_cover = cloud_cover
        self.obs_time = obs_time
        self.wind = wind

    @staticmethod
    def from_dict(obj: Any) -> 'CurrentConditions':
        assert isinstance(obj, dict)
        temp_f = from_int(obj.get("temp_f"))
        condition = from_str(obj.get("condition"))
        humidity = from_int(obj.get("humidity"))
        dew_point_f = from_int(obj.get("dew_point_f"))
        cloud_cover = from_int(obj.get("cloud_cover"))
        obs_time = from_datetime(obj.get("obs_time"))
        wind = Wind.from_dict(obj.get("wind"))
        return CurrentConditions(temp_f, condition, humidity, dew_point_f, cloud_cover, obs_time, wind)

    def to_dict(self) -> dict:
        result: dict = {}
        result["temp_f"] = from_int(self.temp_f)
        result["condition"] = from_str(self.condition)
        result["humidity"] = from_int(self.humidity)
        result["dew_point_f"] = from_int(self.dew_point_f)
        result["cloud_cover"] = from_int(self.cloud_cover)
        result["obs_time"] = self.obs_time.isoformat()
        result["wind"] = to_class(Wind, self.wind)
        return result


class Weather:
    forecast: CurrentConditions
    current_conditions: CurrentConditions

    def __init__(self, forecast: CurrentConditions, current_conditions: CurrentConditions) -> None:
        self.forecast = forecast
        self.current_conditions = current_conditions

    @staticmethod
    def from_dict(obj: Any) -> 'Weather':
        assert isinstance(obj, dict)
        forecast = CurrentConditions.from_dict(obj.get("forecast"))
        current_conditions = CurrentConditions.from_dict(obj.get("current_conditions"))
        return Weather(forecast, current_conditions)

    def to_dict(self) -> dict:
        result: dict = {}
        result["forecast"] = to_class(CurrentConditions, self.forecast)
        result["current_conditions"] = to_class(CurrentConditions, self.current_conditions)
        return result


class GameGame:
    id: UUID
    status: str
    coverage: str
    game_number: int
    day_night: str
    scheduled: datetime
    home_team: UUID
    away_team: UUID
    attendance: int
    duration: str
    double_header: bool
    entry_mode: str
    reference: int
    venue: Venue
    broadcast: Broadcast
    weather: Weather
    final: Final
    home: Home
    away: Away
    pitching: Pitching

    def __init__(self, id: UUID, status: str, coverage: str, game_number: int, day_night: str, scheduled: datetime, home_team: UUID, away_team: UUID, attendance: int, duration: str, double_header: bool, entry_mode: str, reference: int, venue: Venue, broadcast: Broadcast, weather: Weather, final: Final, home: Home, away: Away, pitching: Pitching) -> None:
        self.id = id
        self.status = status
        self.coverage = coverage
        self.game_number = game_number
        self.day_night = day_night
        self.scheduled = scheduled
        self.home_team = home_team
        self.away_team = away_team
        self.attendance = attendance
        self.duration = duration
        self.double_header = double_header
        self.entry_mode = entry_mode
        self.reference = reference
        self.venue = venue
        self.broadcast = broadcast
        self.weather = weather
        self.final = final
        self.home = home
        self.away = away
        self.pitching = pitching

    @staticmethod
    def from_dict(obj: Any) -> 'GameGame':
        assert isinstance(obj, dict)
        id = UUID(obj.get("id"))
        status = from_str(obj.get("status"))
        coverage = from_str(obj.get("coverage"))
        game_number = from_int(obj.get("game_number"))
        day_night = from_str(obj.get("day_night"))
        scheduled = from_datetime(obj.get("scheduled"))
        home_team = UUID(obj.get("home_team"))
        away_team = UUID(obj.get("away_team"))
        attendance = from_int(obj.get("attendance"))
        duration = from_str(obj.get("duration"))
        double_header = from_bool(obj.get("double_header"))
        entry_mode = from_str(obj.get("entry_mode"))
        reference = int(from_str(obj.get("reference")))
        venue = Venue.from_dict(obj.get("venue"))
        broadcast = Broadcast.from_dict(obj.get("broadcast"))
        weather = Weather.from_dict(obj.get("weather"))
        final = Final.from_dict(obj.get("final"))
        home = Home.from_dict(obj.get("home"))
        away = Away.from_dict(obj.get("away"))
        pitching = Pitching.from_dict(obj.get("pitching"))
        return GameGame(id, status, coverage, game_number, day_night, scheduled, home_team, away_team, attendance, duration, double_header, entry_mode, reference, venue, broadcast, weather, final, home, away, pitching)

    def to_dict(self) -> dict:
        result: dict = {}
        result["id"] = str(self.id)
        result["status"] = from_str(self.status)
        result["coverage"] = from_str(self.coverage)
        result["game_number"] = from_int(self.game_number)
        result["day_night"] = from_str(self.day_night)
        result["scheduled"] = self.scheduled.isoformat()
        result["home_team"] = str(self.home_team)
        result["away_team"] = str(self.away_team)
        result["attendance"] = from_int(self.attendance)
        result["duration"] = from_str(self.duration)
        result["double_header"] = from_bool(self.double_header)
        result["entry_mode"] = from_str(self.entry_mode)
        result["reference"] = from_str(str(self.reference))
        result["venue"] = to_class(Venue, self.venue)
        result["broadcast"] = to_class(Broadcast, self.broadcast)
        result["weather"] = to_class(Weather, self.weather)
        result["final"] = to_class(Final, self.final)
        result["home"] = to_class(Home, self.home)
        result["away"] = to_class(Away, self.away)
        result["pitching"] = to_class(Pitching, self.pitching)
        return result


class GameElement:
    game: GameGame

    def __init__(self, game: GameGame) -> None:
        self.game = game

    @staticmethod
    def from_dict(obj: Any) -> 'GameElement':
        assert isinstance(obj, dict)
        game = GameGame.from_dict(obj.get("game"))
        return GameElement(game)

    def to_dict(self) -> dict:
        result: dict = {}
        result["game"] = to_class(GameGame, self.game)
        return result


class League:
    alias: str
    name: str
    id: UUID
    date: datetime
    games: List[GameElement]

    def __init__(self, alias: str, name: str, id: UUID, date: datetime, games: List[GameElement]) -> None:
        self.alias = alias
        self.name = name
        self.id = id
        self.date = date
        self.games = games

    @staticmethod
    def from_dict(obj: Any) -> 'League':
        assert isinstance(obj, dict)
        alias = from_str(obj.get("alias"))
        name = from_str(obj.get("name"))
        id = UUID(obj.get("id"))
        date = from_datetime(obj.get("date"))
        games = from_list(GameElement.from_dict, obj.get("games"))
        return League(alias, name, id, date, games)

    def to_dict(self) -> dict:
        result: dict = {}
        result["alias"] = from_str(self.alias)
        result["name"] = from_str(self.name)
        result["id"] = str(self.id)
        result["date"] = self.date.isoformat()
        result["games"] = from_list(lambda x: to_class(GameElement, x), self.games)
        return result


class DayBoxscore:
    league: League
    comment: str

    def __init__(self, league: League, comment: str) -> None:
        self.league = league
        self.comment = comment

    @staticmethod
    def from_dict(obj: Any) -> 'DayBoxscore':
        assert isinstance(obj, dict)
        league = League.from_dict(obj.get("league"))
        comment = from_str(obj.get("_comment"))
        return DayBoxscore(league, comment)

    def to_dict(self) -> dict:
        result: dict = {}
        result["league"] = to_class(League, self.league)
        result["_comment"] = from_str(self.comment)
        return result


def day_boxscore_from_dict(s: Any) -> DayBoxscore:
    return DayBoxscore.from_dict(s)


def day_boxscore_to_dict(x: DayBoxscore) -> Any:
    return to_class(DayBoxscore, x)
